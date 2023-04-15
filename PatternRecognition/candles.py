import pandas as pd
import json

df=pd.read_csv("sber1.csv")
a=df.iloc[0,4:8]
d=df.iloc[0:1,4:8]
print (a)

def ext_near(x, y):
    return abs(x - y)/max(x, y) <= 0.003

def lar_less(x, y):
    z=(y-x)/x
    return (0.025<=z) and (z<0.05)

def lar_greater(x, y):
    z=(x-y)/x
    return (0.025<=z) and (z<0.05)

def sli_less(x, y):
    z=(y-x)/x
    return (0.003<=z) and (z<0.01)

def sli_greater(x, y):
    z=(x-y)/x
    return (0.003<=z) and (z<0.01)

class Candlestick:
    def __init__(self,b):
        self.op=b[0]
        self.hp=b[1]
        self.lp=b[2]
        self.cp=b[3]

#    def hb(self):
#        return abs(self.cp-self.op)
        self.hb=abs(self.cp-self.op)
        self.tp_body=max(self.op,self.cp)
        self.bm_body= min(self.op, self.cp)
        self.us = self.hp - self.tp_body
        self.ls= self.bm_body- self.lp
        self.hs = self.us + self.ls
        self.black_body= self.op>self.cp
        self.white_body= self.op<self.cp
        self.long_body= lar_less(self.bm_body, self.tp_body)
        self.small_body= sli_less(self.bm_body, self.tp_body)
        self.small_us = sli_greater(self.hp, self.tp_body)
        self.long_us = lar_greater(self.hp, self.tp_body)
        self.long_black_body= self.long_body and self.black_body
        self.long_white_body= self.long_body and self.white_body
        self.no_ls= ext_near(self.lp, self.bm_body)
        self.no_us= ext_near(self.hp, self.tp_body)

class Timeseries:
    def __init__(self,t):
        self.candls=[]
        self.len = len(t)
        for i in range (0,self.len):
            self.candls.append(Candlestick(t.iloc[i]))

def up_body_gap (c1:Candlestick, c2:Candlestick):
    return c1.tp_body < c2.bm_body

def down_body_gap (c1:Candlestick, c2:Candlestick):
    return c1.bm_body  > c2.tp_body

def ap(t:Timeseries, k):
    #средняя close по 5 свечам, начиная с k
    if t.len<k+5: return 0
    s=0
    for i in range (k,k+5):
        s+=t.candls[i].cp
    return s/5

def pt(t:Timeseries):
    # тренд по 1-м 8 свечам
    if t.len<8: return 0
    if ap(t,0)<ap(t,1) and ap(t,1)<ap(t,2) and ap(t,2)<ap(t,3) : return 1
    if ap(t,0)>ap(t,1) and ap(t,1)>ap(t,2) and ap(t,2)>ap(t,3) : return -1
    return 0

#PATTERNS

def marubozu_black(t:Timeseries):
    return (t.len == 1) and t.candls[0].no_us and t.candls[0].long_black_body and t.candls[0].no_ls

def marubozu_white(t:Timeseries):
    return (t.len == 1) and t.candls[0].no_us and t.candls[0].long_white_body and t.candls[0].no_ls

def hammer (t:Timeseries):
#9 свечей - 8 тренд + 1 значимая
    if t.len != 9: return False
    return pt(t)==-1 and t.candls[8].small_body and (not t.candls[8].no_ls) and (2*t.candls[8].hb < t.candls[8].ls and \
        t.candls[8].ls < 3*t.candls[8].hb) and (t.candls[8].small_us or t.candls[8].no_us)

def piercing_pattern (t:Timeseries):
#10 свечей - 8 тренд + 2 значимых
    if t.len != 10: return False
    return pt(t)==-1 and t.candls[8].black_body and t.candls[9].white_body and \
        (t.candls[9].op < t.candls[8].lp) and \
        ((0.5* (t.candls[8].cp + t.candls[8].op) < t.candls[9].cp) and (t.candls[9].cp < t.candls[8].op))

def two_crowns (t:Timeseries):
#11 свечей - 8 тренд + 3 значимых
    if t.len != 11: return False
    return pt(t)==1 and t.candls[8].long_white_body and t.candls[9].black_body and up_body_gap(t.candls[8], t.candls[9]) \
            and t.candls[10].black_body and ((t.candls[9].cp <t.candls[10].op and t.candls[10].op < t.candls[9].op) or \
            (t.candls[8].op <t.candls[10].cp and t.candls[10].cp < t.candls[8].cp))

def concealing_baby_swallow (t:Timeseries):
#12 свечей - 8 тренд + 4 значимых
    if t.len != 12: return False
    return pt(t)==-1 and \
        t.candls[8].no_us and t.candls[8].long_black_body and t.candls[8].no_ls and \
        t.candls[9].no_us and t.candls[9].long_black_body and t.candls[9].no_lsand and\
        t.candls[10].black_body and t.candls[10].long_us and down_body_gap (t.candls[8], t.candls[10]) and \
        down_body_gap (t.candls[9], t.candls[10]) and (t.candls[9].op > t.candls[10].hp and t.candls[10].hp > t.candls[9].cp) \
        and t.candls[11].black_body and t.candls[11].hp > t.candls[10].hp and t.candls[10].lp > t.candls[11].lp

def ladder_bottom (t:Timeseries):
#13 свечей - 8 тренд + 5 значимых
    if t.len != 13: return False
    return pt(t)==-1 and \
        t.candls[8].long_black_body and t.candls[9].long_black_body and t.candls[10].long_black_body and \
        t.candls[9].op < t.candls[8].op and t.candls[10].op < t.candls[9].op and \
        t.candls[9].cp < t.candls[8].cp and t.candls[10].cp < t.candls[9].cp and \
        t.candls[11].black_body and (not t.candls[11].no_us) and t.candls[12].white_body and \
        up_body_gap(t.candls[11], t.candls[12]) 

c=Candlestick(a)
ts=Timeseries(d)
#print (d.iloc[0])
print(ts.len)
print(ts.candls[0].no_ls)

for i in range(8,len(df)):
    d=df.iloc[(i-8):(i+1),4:8]
    ts=Timeseries(d)
    if hammer(ts):
        print (df.iloc[i,2], " - hammer")

#ja =[]

'''
for i in range(0,len(df)):
    jw={}
    d=df.iloc[i:(i+1),4:8]
    ts=Timeseries(d)
    if marubozu_black(ts):
        jw["Pattern"] = "Marubozu Black"
        jw["From"] = str(df.iloc[i,2]) + " " + str(df.iloc[i,3])
        jw["To"] = str(df.iloc[i,2]) + " " + str(df.iloc[i,3])
        ja.append(jw)
#        print (df.iloc[i,2], " - black")
    if marubozu_white(ts):
        jw["Pattern"] = "Marubozu White"
        jw["From"] = str(df.iloc[i,2]) + " " + str(df.iloc[i,3])
        jw["To"] = str(df.iloc[i,2]) + " " + str(df.iloc[i,3])
        ja.append(jw)
        #print (df.iloc[i,2], " - white")
'''
#with open("out.json","w") as jf:
#    json.dump(ja, jf)

#!/bin/env python

import pandas as pd
import matplotlib.pyplot as plt

def main():
    print("Hello World!")
    df = pd.read_csv("data/100u2Vjoined.csv")
    df.apply(getResistances)
    

if __name__ == "__main__":
    main()

def getResistances(volt, cur):
    if(volt == 0.5):
        return volt/cur

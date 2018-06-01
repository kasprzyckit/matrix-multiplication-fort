#!/usr/bin/python3

import matplotlib.pyplot as plt
import numpy as np
import sys

def main():
    if len(sys.argv) < 2:
        print("Too few arguments")
        return

    colors = 'bgrcmykw'
    
    for (i, file) in enumerate(sys.argv[1:-1]):
        X = []
        Y = []
        try:
            with open(file) as f: lines = f.readlines()
        except IOError as e:
            print(str(e))
            return

        for line in lines:
            words = line.split()
            if len(words) != 2: continue
            X.append(int(words[0]))
            Y.append(float(words[1]))

        plt.plot(X, Y, '.', color = colors[i%len(colors)])


    plt.ticklabel_format(style='sci', axis='y', scilimits=(0,0), useOffset=True)
    plt.xlabel('N')
    plt.ylabel('time (s)')
    plt.xscale('log')
    plt.yscale('log')
    plt.savefig(sys.argv[len(sys.argv)-1] + '.png')

if __name__ == '__main__':
    main()
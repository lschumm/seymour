#!/usr/bin/env python3

#
# [common.py]
#
# Common math utilities for Seymour.
# Copyright (C) 2019, Liam Schumm
#

import numpy as np
from libc.math cimport abs

deviate = np.random.normal

cdef rpd(double est, double act):
    # relative percent difference
    return abs(est - act)
#    if est == act:
#        return 0
#    else:
#        return abs(2 * (est - act) / (abs(est) + abs(act)))

def clist_rpd(est, act, length):
    cdef double total = 0;
    cdef int i = 0;

    while i < length:
        total += rpd(est[i], act[i])
        i += 1;

    return total
    
def list_rpd(est, act):
    return clist_rpd(est, act, len(est))
    

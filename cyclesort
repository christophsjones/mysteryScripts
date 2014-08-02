"""Linear time sorting, assuming your list is of the form range(N)"""

# Could be done using linked lists to make append O(1)
def cycle_decomposition(l):
  """Return a list of the cycles in l in linear time"""
  d = {} 
  n = len(l)

  cycles = []
  cyc = []
  i = 0
  start = 0
  while i < n:
    if i not in d:
      d[i] = True
      current = l[i]
      cyc.append(current)
      if current == start:
        cycles.append(cyc)
        start += 1
        i = start
        cyc = []
      else:
        i = current
    else:
      start += 1
      i = start
  return cycles

def cycle_sort(_l):
  """Performs the minimum number of transpositions needed to sort the list"""
  l = _l[:]
  swap_count = 0
  cycles = cycle_decomposition(l)

  for cycle in cycles:
    to_swap, swapper = cycle[:-1], cycle[-1]
    # Performs k - 1 swaps for each cycle of length k
    for i in to_swap:
      swap(l, i, swapper)
      swap_count += 1
  return l, swap_count
    

def swap(l, i, j):
  """The almighty XOR swap"""
  l[i] ^= l[j]
  l[j] ^= l[i]
  l[i] ^= l[j]

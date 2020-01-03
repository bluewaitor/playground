def quick_sort(arr):
    if len(arr) < 2:
        return arr
    base = arr[0]
    left = [i for i in arr[1:] if i <= base]
    right = [i for i in arr[1:] if i > base]
    return quick_sort(left) + [base] + quick_sort(right)


if __name__ == '__main__':
    my_list = [5, 3, 6, 2, 10]
    print(quick_sort(my_list))

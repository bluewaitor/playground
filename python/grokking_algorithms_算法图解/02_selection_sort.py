def selection_sort(arr):
    for i in range(len(arr)):
        index = i
        for j in range(i + 1, len(arr)):
            if arr[index] > arr[j]:
                index = j
        tmp = arr[index]
        arr[index] = arr[i]
        arr[i] = tmp


if __name__ == '__main__':
    my_list = [5, 3, 6, 2, 10]
    selection_sort(my_list)
    print(my_list)

def binary_search(arr, item):
    low = 0
    high = len(arr) - 1

    while low <= high:
        mid = (high + low) // 2
        guess = arr[mid]
        if guess == item:
            return mid
        if guess > item:
            high = mid - 1
        else:
            low = mid + 1
    return None


if __name__ == '__main__':
    my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    print(binary_search(my_list, 3))
    print(binary_search(my_list, -1))

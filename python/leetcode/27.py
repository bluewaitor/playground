# 27. 移除元素
from typing import List


class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        size = len(nums)
        i = 0
        while i < size:
            if nums[i] == val:
                nums[i] = nums[size - 1]
                size -= 1
            else:
                i += 1
        return size


if __name__ == '__main__':
    solution = Solution()
    # nums = [3, 2, 2, 3]  # 3
    # nums = [0, 1, 2, 2, 3, 0, 4, 2]  # 2
    nums = [2, 2, 2]
    print(solution.removeElement(nums, 2))
    print(nums)

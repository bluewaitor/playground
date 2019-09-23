from typing import List, Optional


class Solution:
    def twoSum(self, nums: List[int], target: int) -> Optional[List[int]]:
        index_map = {}
        for index, value in enumerate(nums):
            index_map[value] = index
        for index, value in enumerate(nums):
            remain = target - value
            if remain in index_map and index_map[remain] != index:
                return [index, index_map[remain]]
        return None


if __name__ == '__main__':
    solution = Solution()
    print(solution.twoSum([2, 7, 11, 15], 9))

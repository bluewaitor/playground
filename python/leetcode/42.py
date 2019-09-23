from typing import List


class Solution:
    @staticmethod
    def trap(height: List[int]) -> int:
        size = len(height)
        if size is 0:
            return 0
        l_max = height[0]
        r_max = height[size - 1]
        left = 0
        right = size - 1
        total = 0
        while left <= right:
            l_max = max(l_max, height[left])
            r_max = max(r_max, height[right])

            if l_max <= r_max:
                total += l_max - height[left]
                left += 1
            else:
                total += r_max - height[right]
                right -= 1
        return total


if __name__ == '__main__':
    solution = Solution()
    print(solution.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))

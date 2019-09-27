# 1108. IP地址无效化
class Solution:
    def defangIPaddr(self, address: str) -> str:
        res = ''
        for i in range(len(address)):
            if address[i] != '.':
                res += address[i]
            else:
                res += '[.]'
        return res
        # 或者
        # return address.replace('.', '[.]')


if __name__ == '__main__':
    solution = Solution()
    print(solution.defangIPaddr('1.1.1.1'))

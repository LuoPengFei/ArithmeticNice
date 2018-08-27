'''
1、题目：两数之和

给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。

你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。

示例:

给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
'''

def twoSum( nums, target):
    rtype = []
    for i,value_i in enumerate(nums):
        for j,value_j in enumerate(nums):
#            所有符合的位置
#            if j>i and value_i + value_j == target:
#            满足同1元素只被使用1次时的条件
            if (j>i and value_i + value_j == target) and (i not in rtype and j not in rtype):
                rtype.append(i)
                rtype.append(j)
    rtype = list(set(rtype))
    return rtype
print(twoSum([1,3,4,6,4,1],5))

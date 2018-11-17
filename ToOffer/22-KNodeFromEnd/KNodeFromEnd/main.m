//
//  main.m
//  KNodeFromEnd
//
//  Created by Csy on 2018/11/17.
//  Copyright © 2018 chenlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListNode : NSObject

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) ListNode *next;

@end

@implementation ListNode

@end

ListNode * KthNodeFromEnd(ListNode *head, NSInteger k) {
    if (head == nil || k <= 0 ) {
        return nil;
    }
    
    ListNode *node1 = head;
    ListNode *node2 = head;
    
    // node2 先往前走k-1步
    // 如果还没有走到k-1步，node2为nil，说明链表长度小于k，直接返回nil
    for (NSInteger i = 1; i <= k-1; i++) {
        node2 = node2.next;
        if (node2 == nil) {
            return nil;
        }
    }
    
    // node1，node2同时遍历到尾结点
    while (node2.next != nil) {
        node1 = node1.next;
        node2 = node2.next;
    }
    return node1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ListNode *node1 = [[ListNode alloc] init];
        ListNode *node2 = [[ListNode alloc] init];
        ListNode *node3 = [[ListNode alloc] init];
        ListNode *node4 = [[ListNode alloc] init];
        ListNode *node5 = [[ListNode alloc] init];
        ListNode *node6 = [[ListNode alloc] init];
        ListNode *node7 = [[ListNode alloc] init];
        ListNode *node8 = [[ListNode alloc] init];
        ListNode *node9 = [[ListNode alloc] init];
        
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node5;
        node5.next = node6;
        node6.next = node7;
        node7.next = node8;
        node8.next = node9;
        node9.next = nil;
        
        ListNode *KNode = KthNodeFromEnd(node1, 4);
        NSLog(@"%@",KNode);
    }
    return 0;
}

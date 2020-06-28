题目：反转一个单链表。<br>
示例:<br>
输入: 1->2->3->4->5->NULL <br>
输出: 5->4->3->2->1->NULL <br>
题解分析：<br>
假设列表为:N1-->...-->Nk-1-->Nk-->Nk+1...-->Nm-->null <br>
假设从节点 Nk+1到Nm已经被反转，而我们正处于Nk <br>
N1-->...-->Nk-1-->Nk-->Nk+1<--...<--Nm <br>
我们希望Nk+1的下一个节点指向Nk,所以Nk.next.next = Nk <br>
要小心的是N1的下一个必须指向null <br>
Java代码实现：<br>
public ListNode reverseList(ListNode head) { <br>
    //递归的临界<br>
    if (head == null || head.next == null) return head; <br>
    //递归<br>
    ListNode p = reverseList(head.next); <br>
    //当前节点的反转<br>
    head.next.next = head; <br>
    head.next = null; <br>
    //返回新头节点<br>
    return p; <br>
} <br>

题目：反转一个单链表。<br>
示例:<br>
输入: 1->2->3->4->5->NULL <br>
输出: 5->4->3->2->1->NULL <br>
题解分析：<br>
###方法一：递归
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
###方法二：迭代
在遍历列表时，将当前节点(curr)的 next 指针改为指向前一个元素。由于节点没有引用其上一个节点，因此必须事先存储其前一个元素(prev)。<br>
在更改引用之前，还需要另一个指针来存储下一个节点(nextTemp)。不要忘记在最后返回新的头引用(prev)！<br>
Java代码实现:<br>
public ListNode reverseList(ListNode head) { <br>
    ListNode prev = null;<br>
    ListNode curr = head;<br>
    while (curr != null) {<br>
        ListNode nextTemp = curr.next;<br>
        curr.next = prev;<br>
        prev = curr;<br>
        curr = nextTemp;<br>
    }<br>
    return prev;<br>
}<br>

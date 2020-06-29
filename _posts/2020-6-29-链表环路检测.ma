题目：给定一个有环链表，实现一个算法返回环路的开头节点。<br>
有环链表的定义：在链表中某个节点的next元素指向在它前面出现过的节点，则表明该链表存在环路。<br>
示例 1：<br>
输入：head = [3,2,0,-4], pos = 1<br>
输出：tail connects to node index 1<br>
解释：链表中有一个环，其尾部连接到第二个节点。<br>
示例 2：<br>
输入：head = [1,2], pos = 0<br>
输出：tail connects to node index 0<br>
解释：链表中有一个环，其尾部连接到第一个节点。<br>
示例 3：<br>
输入：head = [1], pos = -1<br>
输出：no cycle<br>
解释：链表中没有环。<br>
题解分析:<br>
![_config.yml]({{site.baseurl}}/images/JS链表环路检测.png)<br>
第一步：如果链表中有环，那么快慢指针就一定可以相遇（且一定在环上，如图上的c点），此时快指针移动过的距离是慢指针的2倍，根据图中的参数，我们可以写出以下等式：<br>
(m+y)*2=m+xn+y //这里的xn是当相遇时快指针已经在环上循环了x次，x>=1且为整数<br>
=> m+y=xn => m=n-y+(x-1)*n //下面解释为什么写成这种形式<br>
第二步：接下来将快指针置于表头(此时快指针在a处，慢指针在c处)，与慢指针以相同速度在链表上移动，当快指针移动到b处时，移动了m的距离，根据上面的等式可知，慢指针移动了n-y+(x-1)*n的距离。<br>
我们来分析一下此时的慢指针在什么位置：<br>
先移动(x-1)*n的距离，相当于在环上循环了(x-1)次，慢指针又回到了c点，然后再移动n-y的距离，如图所示，n-y正好是c点到b点的距离，说明此时慢指针也移动到了b点，即快慢指针在环路的开头节点相遇了。<br>
Java代码实现：<br>
    // 先检测有没有环； 然后找位置<br>
    public ListNode detectCycle(ListNode head) {<br>
        if (head == null || head.next == null) {<br>
            return null;<br>
        }<br>
        ListNode slow = head, fast = head;       <br> 
        while (fast != null && fast.next != null) {<br>
            slow = slow.next;<br>
            fast = fast.next.next;<br>
            // 此处如果用if (slow != null && fast != null && slow.val == fast.val) 会超出时间限制<br>
            if (slow == fast) {<br>
                break;<br>
            }<br>
        }<br>
        if (fast == null || fast.next == null) {<br>
            return null;<br>
        }<br>

        // slow从head开始，fast从相遇点开始，一步一步走再次相遇即为环入口<br>
        slow = head;<br>
        while (slow != fast) {<br>
            slow = slow.next;<br>
            fast = fast.next;<br>
        }<br>
        return slow;<br>
    }<br>

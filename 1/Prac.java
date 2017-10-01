import java.util.*;

class Main {
	public static void main(String[] args)
	{
        Deque<Integer> deque = new ArrayDeque<Integer>();
        deque.push(1);
        deque.push(2);    
        
        System.out.println(deque.poll());
        System.out.println(deque.poll());
	}
}

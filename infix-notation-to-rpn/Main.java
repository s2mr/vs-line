import java.util.*;

class Main {
	public static void main(String[] args)
	{
		Deque<Character> deque = new ArrayDeque<Character>();
        deque.push('a');
        deque.push('b');
        deque.push('c');
        
        System.out.println(deque.peek());
        System.out.println(deque.peek());
        
        
        System.out.println(deque.pop());
        System.out.println(deque.pop());
	}
}

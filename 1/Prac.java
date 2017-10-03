import java.util.*;

class Main {
	public static void main(String[] args)
	{
		String str = "1 2 +";
        solveAndPrintRPN(str);
	}
    
    public static void solveAndPrintRPN(String expression) {
        String[] arr = expression.split(" ", 0);

        Deque <Integer> deque = new ArrayDeque <Integer>();
        for(int i = 0; i < arr.length; i++)
        {
            int num;
            try
            {
                // arr[i]が数字だった場合
                num = Integer.parseInt(arr[i]);
                deque.push(num);
            }
            catch (NumberFormatException e)
            {
                // arr[i]が演算子だった場合
                int num2 = deque.poll();
                int num1 = deque.poll();

                int ans=0;
                switch(arr[i])
                {
                case "+":
                    ans = num1 + num2;
                    break;
                case "-":
                    ans = num1 - num2;
                    break;
                case "*":
                    ans = num1 * num2;
                    break;
                case "/":
                    ans = num1 / num2;
                    break;
                }
                deque.push(ans);
            }
        }
        
        System.out.println(deque.poll());
    }
}

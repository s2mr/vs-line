import java.util.*;

class Main {
    
    static Map<Character, Integer> arith = new HashMap<Character, Integer>() {
        {
            put('(' , 4);
            put('#' , 3);
            put('*' , 2);
            put('/' , 2);
            put('+' , 1);
            put('-' , 1);
            put(')' , 0);
        }
    };
    
	public static void main(String[] args)
	{
        String exp = "(10+20)*(30-40)+50/2";
        String expRPN = infixNotationToRPN(exp);
        
        System.out.println(expRPN);
        // System.out.println(arith.get('('));
        
        // String str = "10 20 + 30 40 - * 50 2 / +";
        // solveAndPrintRPN(str);
	}
    
    public static String infixNotationToRPN(String exp) {
        
        exp = exp.replace(" ", ""); //空白文字の除去
        exp = "(" + exp + ")";
        
        String tmpNum="";
        String ans="";
        Deque<Character> deque = new ArrayDeque<Character>();
        for (int i=0; i<exp.length(); i++) {
            Character c = exp.charAt(i);
            if('0'<=c && c<='9') {
                // 数字の場合
                tmpNum += c;
            } else {
                //演算子の場合
                if (tmpNum!="") {
                    if (ans!="") {
                        // すでに値が入っている時
                        ans += " ";
                    }
                    ans += tmpNum;
                    tmpNum="";
                }
                
                while (!deque.isEmpty() && arith.get(deque.peek()) > arith.get(c) && deque.peek() != '(' ) {
                    ans += " ";
                    ans += deque.pop();
                }
                
                if (c==')') {
                    deque.pop();
                } else { 
                    deque.push(c);
                }
                
                // System.out.println(tmpNum);    
                
            }
            
            
            
        }
        
        return ans;
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

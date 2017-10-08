import java.util.*;
import java.util.regex.*;

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
        
        int res = validateExp(args);
        if (res != 0) {
            System.err.println("エラーコード" + res + "で終了します。");
            System.exit(res);
        }
        
        String exp = args[0];
        String expRPN = infixNotationToRPN(exp);
        
        System.out.println(expRPN);
        
        // String str = "10 20 + 30 40 - * 50 2 / +";
        int ans = solveRPN(expRPN);
        System.out.println(ans);
	}
    
    public static int validateExp(String[] args) {
        
        // 与えられた引数が１つでない場合
        if(args.length != 1) {
            return 1;
        }
        
        String exp = args[0];
        exp = exp.replace(" ", "");
        // 引数が空白のみの場合
        if (exp.length()==0) {
            return 1;
        }
        
        // System.out.println("exp: " + exp);
        
        //不正な文字が含まれていないかチェック
        String regex = "([0-9\\+\\-\\*/\\(\\)])+";
        Pattern p = Pattern.compile(regex);
        for (int i=0; i<exp.length(); i++) {
            Character c = exp.charAt(i);
            Matcher m = p.matcher(c.toString());
            if (!m.find()) {
                return 2;
            }
        }
        
        //括弧の数が合っているかチェック
        int count=0;
        for (int i=0; i<exp.length(); i++) {
            char c = exp.charAt(i);
            if (c=='(') {
                count++;
            } else if (c==')') {
                count--;
            }
        }
        if (count!=0) {
            return 3;
        }
        
        
        return 0;
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
                    // '(' は出力しないため除去
                    deque.pop();
                } else { 
                    deque.push(c);
                }
                
                // System.out.println(tmpNum);    
            }
        }
        return ans;
    }
    
    public static int solveRPN(String exp) {
        Deque <Integer> deque = new ArrayDeque <Integer>();
        String[] arr =  exp.split(" ", 0);
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
        
        return deque.poll();
    }
}

import java.util.*;
import java.util.Map.Entry;

public class Main {
    
    static final String source = "IHZHNTQARGPIRNRFOHQXHIHZHNTQARGRCEHKOKJXIAKQWXAJXFRMFTZHXALQRKXRWXAKKHIZTGQKWXTQLOKQKRRGQTDHPNTJHXHLTMHAQDGRWGSBKHGMAGFXAKTGFHNQRXAKKHIZTGQERXGWXRQHKQACAHKQRHZHIBQXAGFXHKTWQXTQAKQXHWRIMRCFRMTGMQXHQHKQALRGBRCEHKOKJXIAKQSNHKKHMAKQXHRGHWXRIHTMKQXHWRIMKRCQXAKPIRPXHJBTGMSNHKKHMTIHQXRKHWXRXHTIAQTGMQTDHQRXHTIQWXTQAKWIAQQHGAGAQSHJTOKHQXHQALHAKGHTIFIHHQAGFKTGMMRURNRFBERXGQRQXHKHZHGJXOIJXHKAGQXHPIRZAGJHRCTKATFITJHTGMPHTJHQRBROCIRLXALWXRAKTGMWXRWTKTGMWXRAKQRJRLHTGMCIRLQXHKHZHGKPAIAQKSHCRIHXAKQXIRGHTGMCIRLEHKOKJXIAKQWXRAKQXHCTAQXCONWAQGHKKQXHCAIKQSRIGCIRLQXHMHTMTGMQXHIONHIRCQXHDAGFKRCQXHHTIQXQRXALWXRNRZHKOKTGMXTKCIHHMOKCIRLROIKAGKSBXAKSNRRMTGMXTKLTMHOKQRSHTDAGFMRLTGMPIAHKQKQRKHIZHXAKFRMTGMCTQXHIQRXALSHFNRIBTGMPRWHICRIHZHITGMHZHITLHGNRRDXHAKJRLAGFWAQXQXHJNROMKTGMHZHIBHBHWANNKHHXALHZHGQXRKHWXRPAHIJHMXALTGMTNNQXHPHRPNHKRCQXHHTIQXWANNLROIGSHJTOKHRCXALKRKXTNNAQSHTLHGATLQXHTNPXTTGMQXHRLHFTKTBKQXHNRIMFRMWXRAKTGMWXRWTKTGMWXRAKQRJRLHQXHTNLAFXQBRGHNADHTKRGRCLTGAERXGBROISIRQXHITGMJRLPTGARGAGQXHKOCCHIAGFTGMDAGFMRLTGMPTQAHGQHGMOITGJHQXTQTIHROIKAGEHKOKWTKRGQXHAKNTGMRCPTQLRKSHJTOKHRCQXHWRIMRCFRMTGMQXHQHKQALRGBRCEHKOKRGQXHNRIMKMTBAWTKAGQXHKPAIAQTGMAXHTIMSHXAGMLHTNROMZRAJHNADHTQIOLPHQWXAJXKTAMWIAQHRGTKJIRNNWXTQBROKHHTGMKHGMAQQRQXHKHZHGJXOIJXHKQRHPXHKOKKLBIGTPHIFTLOLQXBTQAITKTIMAKPXANTMHNPXATTGMNTRMAJHTAQOIGHMTIROGMQRKHHQXHZRAJHQXTQWTKKPHTDAGFQRLHTGMWXHGAQOIGHMAKTWKHZHGFRNMHGNTLPKQTGMKTGMTLRGFQXHNTLPKQTGMKWTKKRLHRGHNADHTKRGRCLTGMIHKKHMAGTIRSHIHTJXAGFMRWGQRXAKCHHQTGMWAQXTFRNMHGKTKXTIROGMXAKJXHKQXAKXHTMTGMXTAIWHIHWXAQHNADHWRRNTKWXAQHTKKGRWTGMXAKHBHKWHIHNADHSNTVAGFCAIHXAKCHHQWHIHNADHSIRGVHFNRWAGFAGTCOIGTJHTGMXAKZRAJHWTKNADHQXHKROGMRCIOKXAGFWTQHIKAGXAKIAFXQXTGMXHXHNMKHZHGKQTIKTGMROQRCXAKLROQXJTLHTKXTIPMROSNHHMFHMKWRIMXAKCTJHWTKNADHQXHKOGKXAGAGFAGTNNAQKSIANNATGJHWXHGAKTWXALACHNNTQXAKCHHQTKQXROFXMHTMQXHGXHPNTJHMXAKIAFXQXTGMRGLHTGMKTAMMRGRQSHTCITAMATLQXHCAIKQTGMQXHNTKQATLQXHNAZAGFRGHAWTKMHTMTGMSHXRNMATLTNAZHCRIHZHITGMHZHIGMAXRNMQXHDHBKRCMHTQXTGMXTMHKWIAQHQXHIHCRIHWXTQBROXTZHKHHGWXTQAKGRWTGMWXTQWANNQTDHPNTJHNTQHIQXHLBKQHIBRCQXHKHZHGKQTIKQXTQBROKTWAGLBIAFXQXTGMTGMRCQXHKHZHGFRNMHGNTLPKQTGMKAKQXAKQXHKHZHGKQTIKTIHQXHTGFHNKRCQXHKHZHGJXOIJXHKTGMQXHKHZHGNTLPKQTGMKTIHQXHKHZHGJXOIJXHK";
    
    static final Map<Character, Character> map = new HashMap<Character, Character>() {
        {
            put('A','.');
            put('B','.');
            put('C','.');
            put('D','.');
            put('E','.');
            put('F','.');
            put('G','.');
            put('H','.');
            put('I','.');
            put('J','.');
            put('K','.');
            put('L','.');
            put('M','.');
            put('N','.');
            put('O','.');
            put('P','.');
            put('Q','.');
            put('R','.');
            put('S','.');
            put('T','.');
            put('U','.');
            put('V','.');
            put('W','.');
            put('X','.');
            put('Y','.');
            put('Z','.');
        }
    };
    
    public static void main(String[] args) {
        new Main();
    }
    
    public Main() {
        
        frequency();
        replacePrint();
    }
    
    public void replacePrint() {
        for (int i=0; i<source.length(); i++) {
            char c = source.charAt(i);
            try {
                c = map.get(c);
            } catch (NullPointerException e) {
            }
            
            System.out.print(c);
        }
        System.out.println();
    }
    
    public void frequency() {
        
        Map<Character, Integer> frequency = new HashMap<Character, Integer>();
        
        for (int i=0; i<source.length(); i++) {
            char c = source.charAt(i);
            int count = 0;
            
            try {
                count = frequency.get(c);
            } catch(NullPointerException e) {
            }
            count++;
            frequency.put(c, count);
        }
        
        // 降順で並べ替え
        List<Entry<Character, Integer>> list_entries = new ArrayList<Entry<Character, Integer>>(frequency.entrySet());
        Collections.sort(list_entries, new Comparator<Entry<Character, Integer>>() {
            public int compare(Entry<Character, Integer> obj1, Entry<Character, Integer> obj2)
            {
                return obj2.getValue().compareTo(obj1.getValue());
            }
        });
        
        for (Entry<Character, Integer> entry : list_entries) {
            Character key = entry.getKey();
            Integer val = entry.getValue();
            
            System.out.println(String.format("%c : %d   \t(%f%%)", key, val, Double.valueOf(val)/Double.valueOf(source.length())*100));
        }        
    }
}
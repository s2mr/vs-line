public class EightQueensProblem {
	
	static final int N = 4; //盤面のサイズ
	
	Board board = new Board();
	
	public static void main(String[] args) {
		new EightQueensProblem();
	}
	
	public EightQueensProblem() {
		board.setQueen(2,1,true);
		// System.out.println(board.toString());
		// 
		// System.out.println("isAttacked : " + board.isAttacked(2,1));
		dsf(0);
	}
	
	public boolean dsf(int y) {
		
		if (y==N) {
			System.out.println(board.toString());
			return false;
		}
		
		for (int x=0; x<N; x++) {
			if (!board.isAttacked(x, y)) {
				board.setQueen(x, y, true);
				
				if ( dsf(y+1) ) {
					return true;
				}
				
				board.setQueen(x, y, false);
			}
		}
		
		return false;
	}
	
	public class Board {
		private boolean[] row = new boolean[N];
		private boolean[] col = new boolean[N];
		private boolean[] pos = new boolean[N * 2 - 1];
		private boolean[] neg = new boolean[N * 2 - 1];
		private boolean[] queen[] = new boolean[N][N];
		
		public boolean isAttacked(int x, int y) {
			if (row[y] || col[x] || pos[x+y] || neg[y-x+N-1]) {
				return true;
			}
			return false;
		}
		
		public void setQueen(int x, int y, boolean flag) {
			queen[y][x] = flag;
			row[y] = flag;
			col[x] = flag;
			pos[x+y] = flag;
			neg[y-x+N-1] = flag;
		}
		
		@Override
		public String toString() {
			StringBuilder sb = new StringBuilder();
			
			for (int y=0; y<N; y++) {
				for (int x=0; x<N; x++) {
					if (queen[y][x]) {
						sb.append("o ");
						continue;
					}
					sb.append("x ");
				}
				sb.append("\n");
			}
			return sb.toString();
		}
	}
}
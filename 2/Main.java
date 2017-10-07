class Main {
	private static final int N = 4;
	
	int[][] board = new int[N][N];
	
	public static void main(String[] args)
	{
        
		init(board);
		
		put(board);
		
		print(board);
	}
	
	private static void init() {
		for (int i=0; i<N; i++) {
			for (int j=0; j<N; j++) {
				if (i==0 && j==0) {
					board[i][j] = 1;
				} else {
					board[i][j] = 0;
				}
			}
		}
	}
	
	private static int[][] put(int i, int j) {
		for (int i=0; i<N; i++) {
			for (int j=0; j<N; j++) {
					
			}
		}
	}
	
	private static void print(int[][] board) {
		for (int i=0; i<N; i++) {
			for (int j=0; j<N; j++) {
				System.out.print(board[i][j] + " ");
			}
			System.out.println();
		}
	}
}

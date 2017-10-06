class Main {
	private static final int N = 4;
	
	public static void main(String[] args)
	{
        int[][] board = new int[N][N];
		board = init(board);
		print(board);
	}
	
	private static int[][] init(int[][] board) {
		for (int i=0; i<N; i++) {
			for (int j=0; j<N; j++) {
				board[i][j] = 0;
			}
		}
		return board;
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

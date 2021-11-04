package co.edu.unal.thirdattempt;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.os.Bundle;

import edu.harding.tictactoe.TicTacToeGame;

public class MainActivity extends AppCompatActivity {
    private TicTacToeGame mGame;
    // Buttons making up the board
    private Button[] mBoardButtons;
    // Various text displayed
    private TextView mInfoTextView;

    public void onCreate(Bundle savedInstanceState) {


        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mBoardButtons = new Button[TicTacToeGame.BOARD_SIZE];
        mBoardButtons[0] = (Button) findViewById(R.id.one);
        mBoardButtons[1] = (Button) findViewById(R.id.two);
        mBoardButtons[2] = (Button) findViewById(R.id.three);
        mBoardButtons[3] = (Button) findViewById(R.id.four);
        mBoardButtons[4] = (Button) findViewById(R.id.five);
        mBoardButtons[5] = (Button) findViewById(R.id.six);
        mBoardButtons[6] = (Button) findViewById(R.id.seven);
        mBoardButtons[7] = (Button) findViewById(R.id.eight);
        mBoardButtons[8] = (Button) findViewById(R.id.nine);
        mInfoTextView = (TextView) findViewById(R.id.information);

        mGame = new TicTacToeGame();

        startNewGame();


        }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu); menu.add("New Game");
        return true;
    }






        private void setMove(char player, int location) {
        mGame.setMove(player, location);
        mBoardButtons[location].setEnabled(false);
        mBoardButtons[location].setText(String.valueOf(player));
        if (player == TicTacToeGame.HUMAN_PLAYER)
            mBoardButtons[location].setTextColor(Color.rgb(0, 200, 0));
        else
            mBoardButtons[location].setTextColor(Color.rgb(200, 0, 0));
    }




    // Set up the game board.
    private void startNewGame() {
        mGame.clearBoard();
        for (int i = 0; i < mBoardButtons.length; i++) {
            mBoardButtons[i].setText("");
            mBoardButtons[i].setEnabled(true);
            mBoardButtons[i].setOnClickListener((View.OnClickListener) new ButtonClickListener(i));
        }
        // Human goes first
        mInfoTextView.setText("You go first.");
        } // End of startNewGame

    @Override
        public boolean onOptionsItemSelected(MenuItem item) {
        startNewGame();
        return true;}

    // Handles clicks on the game board buttons
    private class ButtonClickListener implements View.OnClickListener {
        int location;

        public ButtonClickListener(int location) {
            this.location = location;
        }

        @Override
        public void onClick(View v) {
                if (mBoardButtons[location].isEnabled()) {
                setMove(edu.harding.tictactoe.TicTacToeGame.HUMAN_PLAYER, location);
                // If no winner yet, let the computer make a move
                int winner = mGame.checkForWinner();
                if (winner == 0) {
                        mInfoTextView.setText("It's Android's turn.");
                        int move = mGame.getComputerMove();
                        setMove(TicTacToeGame.COMPUTER_PLAYER, move);
                        winner = mGame.checkForWinner();
                        }
                if (winner == 0) mInfoTextView.setText("It's your turn.");
                else if (winner == 1) mInfoTextView.setText("It's a tie!");
                else if (winner == 2) mInfoTextView.setText("You won!");
                else
                     mInfoTextView.setText("Android won!");
            }

        }





    }


}




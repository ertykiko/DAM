package co.edu.unal.thirdattempt;


import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.os.Bundle;
import android.widget.Toast;

import edu.harding.tictactoe.TicTacToeGame;

public class MainActivity extends AppCompatActivity {

    private static final String TAG = "AndroidTicTacToe";

    // for preferences
    static final int DIALOG_DIFFICULTY_ID = 0;
    static final int DIALOG_QUIT_ID = 1;
    static final int DIALOG_ABOUT_ID = 2;
    static final int DIALOG_RESET_ID = 3;
    private SharedPreferences mPrefs;
    private int mDiffLev;

    //Turn
    private char mTurn;

    //Who goes first
    private char mGoesFirst;

    // Keep track of wins
    private int mHumanWins = 0;
    private int mComputerWins = 0;
    private int mTies = 0;

    //Game logic
    private TicTacToeGame mGame;

    // Buttons making up the board
    private Button[] mBoardButtons;

    //If game is over
    private boolean mGameOver;


    // Various text displayed
    private TextView mInfoTextView;
    private TextView mHumanScoreTextView;
    private TextView mComputerScoreTextView;
    private TextView mTieScoreTextView;

    @Override
    public void onCreate(Bundle savedInstanceState) {


        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //mHumanWins = mPrefs.getInt("mHumanWins", 0);
        //mComputerWins = mPrefs.getInt("mComputerWins", 0);
        //mTies = mPrefs.getInt("mTies", 0);

        mGame = new TicTacToeGame();

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
        //mHumanScoreTextView = (TextView) findViewById(R.id.player_score);
        //mComputerScoreTextView = (TextView) findViewById(R.id.computer_score);
        //mTieScoreTextView = (TextView) findViewById(R.id.tie_score);



        mTurn = TicTacToeGame.HUMAN_PLAYER;
        mGoesFirst = TicTacToeGame.COMPUTER_PLAYER;
        startNewGame(true);




        //displayScores();

    }

    // Set up the game board.
    private void startNewGame(boolean first){
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
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.options_menu, menu);
        return true;
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.new_game:
                startNewGame(true);
                return true;
            case R.id.ai_difficulty:
                showDialog(DIALOG_DIFFICULTY_ID);
                return true;
            case R.id.quit:
                showDialog(DIALOG_QUIT_ID);
                return true;
        }
        return false;
    }

    @Override
    protected Dialog onCreateDialog(int id) {
        Dialog dialog = null;
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        switch(id) {
            case DIALOG_DIFFICULTY_ID:
                builder.setTitle(R.string.difficulty_choose);
                final CharSequence[] levels = {
                        getResources().getString(R.string.difficulty_easy),
                        getResources().getString(R.string.difficulty_harder),
                        getResources().getString(R.string.difficulty_expert)};
                final int selected = mGame.getDifficultyLevel().ordinal();
                // TODO: Set selected, an integer (0 to n-1), for the Difficulty dialog.
                // selected is the radio button that should be selected.
                builder.setSingleChoiceItems(levels, selected,
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int item) {
                                dialog.dismiss(); // Close dialog

                                mGame.setDifficultyLevel(TicTacToeGame.DifficultyLevel.values()[item]);
                                Log.d(TAG, "Difficulty level: " + mGame.getDifficultyLevel());
                                mDiffLev = mGame.getDifficultyLevel().ordinal();
                // TODO: Set the diff level of mGame based on which item was selected.
                // Display the selected difficulty level
                                Toast.makeText(getApplicationContext(), levels[item],
                                        Toast.LENGTH_SHORT).show();
                            }
                        });
                dialog = builder.create();
                break;
            case DIALOG_QUIT_ID:
// Create the quit confirmation dialog
                builder.setMessage(R.string.quit_question)
                        .setCancelable(false)
                        .setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                MainActivity.this.finish();
                            }
                        })
                        .setNegativeButton(R.string.no, null);
                dialog = builder.create();
                break;
        }
        return dialog;
    }

    private void displayScores() {
        mHumanScoreTextView.setText(Integer.toString(mHumanWins));
        mComputerScoreTextView.setText(Integer.toString(mComputerWins));
        mTieScoreTextView.setText(Integer.toString(mTies));
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
                if(mGameOver == true){
                    endGame(winner);
                }
                if (!mGameOver && winner == 0) {
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
    // Game is over logic
    private void endGame(int winner) {
        if (winner == 1) {
            mTies++;
            mTieScoreTextView.setText(Integer.toString(mTies));
            mInfoTextView.setText(R.string.result_tie);
        }
        else if (winner == 2) {
            mHumanWins++;
            mHumanScoreTextView.setText(Integer.toString(mHumanWins));
            mInfoTextView.setText(R.string.result_human_wins);
        }
        else {
            mComputerWins++;
            mComputerScoreTextView.setText(Integer.toString(mComputerWins));
            mInfoTextView.setText(R.string.result_computer_wins);
        }
        mGameOver = true;
    }


}
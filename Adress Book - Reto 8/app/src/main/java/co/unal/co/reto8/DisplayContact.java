package co.unal.co.reto8;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class DisplayContact extends AppCompatActivity {
    int from_Where_I_Am_Coming = 0;
    private DBHelper mydb ;

    TextView name ;
    TextView phone;
    TextView email;
    TextView products;
    TextView url;
    Spinner type;

    int id_To_Update = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_contact);
        name = (TextView) findViewById(R.id.editTextName);
        phone = (TextView) findViewById(R.id.editTextPhone);
        products = (TextView) findViewById(R.id.editTextProducts);
        email = (TextView) findViewById(R.id.editTextEmail);
        url = (TextView) findViewById(R.id.editTextWeb);
        type = findViewById(R.id.spinner_type);

        ArrayAdapter<CharSequence>adapter= ArrayAdapter.createFromResource(this, R.array.type_option, android.R.layout.simple_spinner_item);

        adapter.setDropDownViewResource(android.R.layout.simple_spinner_item);

        type.setAdapter(adapter);


        mydb = new DBHelper(this);

        Bundle extras = getIntent().getExtras();
        if(extras !=null) {
            int Value = extras.getInt("id");

            if(Value>0){
                //means this is the view part not the add contact part.
                Cursor rs = mydb.getData(Value);
                id_To_Update = Value;

                rs.moveToFirst();

                String nam = rs.getString(rs.getColumnIndexOrThrow(DBHelper.CONTACTS_COLUMN_NAME));
                String phon = rs.getString(rs.getColumnIndexOrThrow(DBHelper.CONTACTS_COLUMN_PHONE));
                String emai = rs.getString(rs.getColumnIndexOrThrow(DBHelper.CONTACTS_COLUMN_EMAIL));
                String prod = rs.getString(rs.getColumnIndexOrThrow(DBHelper.CONTACTS_COLUMN_PRODUCTS));
                String typ = rs.getString(rs.getColumnIndexOrThrow(DBHelper.CONTACTS_COLUMN_TYPE));
                String web = rs.getString(rs.getColumnIndexOrThrow(DBHelper.CONTACTS_COLUMN_URL));




                if (!rs.isClosed())  {
                    rs.close();
                }
                Button b = (Button)findViewById(R.id.save_button);
                b.setVisibility(View.INVISIBLE);

                name.setText((CharSequence)nam);
                name.setFocusable(false);
                name.setClickable(false);

                phone.setText((CharSequence)phon);
                phone.setFocusable(false);
                phone.setClickable(false);

                email.setText((CharSequence)emai);
                email.setFocusable(false);
                email.setClickable(false);

                products.setText((CharSequence)prod);
                products.setFocusable(false);
                products.setClickable(false);

                type.setFocusable(false);
                type.setClickable(false);

                url.setText((CharSequence)web);
                url.setFocusable(false);
                url.setClickable(false);
            }
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        Bundle extras = getIntent().getExtras();

        if(extras !=null) {
            int Value = extras.getInt("id");
            if(Value>0){
                getMenuInflater().inflate(R.menu.display_contact, menu);
            } else{
                getMenuInflater().inflate(R.menu.main_menu, menu);
            }
        }
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        super.onOptionsItemSelected(item);
        switch(item.getItemId()) {
            case R.id.Edit_Contact:
                Button b = (Button)findViewById(R.id.save_button);
                b.setVisibility(View.VISIBLE);
                name.setEnabled(true);
                name.setFocusableInTouchMode(true);
                name.setClickable(true);

                phone.setEnabled(true);
                phone.setFocusableInTouchMode(true);
                phone.setClickable(true);

                email.setEnabled(true);
                email.setFocusableInTouchMode(true);
                email.setClickable(true);

                products.setEnabled(true);
                products.setFocusableInTouchMode(true);
                products.setClickable(true);

                url.setEnabled(true);
                url.setFocusableInTouchMode(true);
                url.setClickable(true);

                type.setEnabled(true);
                type.setFocusableInTouchMode(true);
                type.setClickable(true);


                return true;
            case R.id.Delete_Contact:

                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setMessage(R.string.deleteContact)
                        .setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                mydb.deleteContact(id_To_Update);
                                Toast.makeText(getApplicationContext(), "Deleted Successfully",
                                        Toast.LENGTH_SHORT).show();
                                Intent intent = new Intent(getApplicationContext(),MainActivity.class);
                                startActivity(intent);
                            }
                        })
                        .setNegativeButton(R.string.no, new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                // User cancelled the dialog
                            }
                        });

                AlertDialog d = builder.create();
                d.setTitle("Are you sure");
                d.show();

                return true;
            default:
                return super.onOptionsItemSelected(item);

        }
    }

    public void run(View view) {
        Bundle extras = getIntent().getExtras();
        if(extras !=null) {
            int Value = extras.getInt("id");
            if(Value>0){
                if(mydb.updateContact(id_To_Update,name.getText().toString(),
                        phone.getText().toString(), email.getText().toString(),
                        products.getText().toString(), url.getText().toString(),type.getText().toString())){
                    Toast.makeText(getApplicationContext(), "Updated", Toast.LENGTH_SHORT).show();
                    Intent intent = new Intent(getApplicationContext(),MainActivity.class);
                    startActivity(intent);
                } else{
                    Toast.makeText(getApplicationContext(), "not Updated", Toast.LENGTH_SHORT).show();
                }
            } else{
                if(mydb.insertContact(name.getText().toString(), phone.getText().toString(),
                        email.getText().toString(), products.getText().toString(),
                        url.getText().toString(),type.getText().toString())){
                    Toast.makeText(getApplicationContext(), "done",
                            Toast.LENGTH_SHORT).show();
                } else{
                    Toast.makeText(getApplicationContext(), "not done",
                            Toast.LENGTH_SHORT).show();
                }
                Intent intent = new Intent(getApplicationContext(),MainActivity.class);
                startActivity(intent);
            }
        }
    }
}
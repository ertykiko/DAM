package co.edu.unal.reto9_gps;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

import co.edu.unal.reto9_gps.R;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;

public class SearchActivity extends AppCompatActivity {



    TextView et_longitude ;
    TextView et_radius;
    TextView et_latitude;

    //---Parameters of search --- //
    private String selectedPOI = "bank";
    private String latitude = "41.1606" ;
    private String longitude = "-8.629" ;
    private String radius = "5" ;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.search_activity);

        //Spinner Start
        Spinner spinner = (Spinner) findViewById(R.id.poi_spinner);
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.poi_array, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        spinner.setAdapter(adapter);

        et_longitude = (TextView) findViewById(R.id.et_longi);
        et_latitude = (TextView) findViewById(R.id.et_lat);
        et_radius = (TextView) findViewById(R.id.et_radius);

        Button search_bttn = (Button) findViewById(R.id.sbutton);
        search_bttn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                // Do something in response to button click
                selectedPOI = spinner.getSelectedItem().toString().toLowerCase();
                latitude = et_latitude.getText().toString();
                longitude = et_longitude.getText().toString();
                radius = et_radius.getText().toString();

                //---Log parameters to find possible mistakes----//
                Log.d("POI", selectedPOI);
                Log.d("Latitude", latitude);
                Log.d("Longitude", longitude);
                Log.d("Radius", radius);

                Intent intent = new Intent(SearchActivity.this,MainActivity.class);
                intent.putExtra("latitude_key", latitude);
                intent.putExtra("longitude_key", longitude);
                intent.putExtra("radius_key", radius);
                intent.putExtra("poi_key", selectedPOI);
                setResult(2,intent);

                finish();

            }
        });


    }
}

int vibrationMotorPin = D7;

int pressureSensorPin = A0;
int pressureReading;
int pressureThreshold = 100;
bool wasThroneOccupied = false;


void setup()
{
    // vibration motor
    pinMode( vibrationMotorPin, OUTPUT );
    digitalWrite( vibrationMotorPin, LOW );
    
    Particle.function( "notify", notify );
    
    // pressure sensor
    pinMode( pressureSensorPin, INPUT );
    Particle.variable("pressure", pressureReading);
}


void loop()
{
   pressureReading = analogRead( pressureSensorPin );
   
   bool isThroneOccupied = pressureReading > pressureThreshold;
   if ( isThroneOccupied && !wasThroneOccupied ) {
       Particle.publish( "throneStatus", "occupied" );
   }
   if ( !isThroneOccupied && wasThroneOccupied ) {
       Particle.publish( "throneStatus", "vacant" );
   }
   wasThroneOccupied = isThroneOccupied;
}



int notify( String notification ) {
    if ( notification == "assassination" ) {
        notifyAssassination();
        return 0;
    }
    
    return -1;
}

void notifyAssassination() {
    for ( int i = 0; i < 4; i++ ) {
        digitalWrite( vibrationMotorPin, HIGH );
        delay( 500 );
        digitalWrite( vibrationMotorPin, LOW );
        delay( 500 );
    }
}


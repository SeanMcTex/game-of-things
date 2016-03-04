int vibrationMotorPin = D7;
int pressureSensorPin = A4;

int pressureReading;
int pressureThreshold = 100;
bool wasThroneOccupied = false;
int standInterval = 1000 * 60 * 0.25;
int lastStandTime;


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
    
    if ( isThroneOccupied ) {
        if ( lastStandTime + standInterval < millis() ) {
            notifyTimeToStand();
        }
    } else {
        lastStandTime = millis();
    }
    
    delay( 500 );
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

void notifyTimeToStand() {
    digitalWrite( vibrationMotorPin, HIGH );
    delay( 3000 );
    digitalWrite( vibrationMotorPin, LOW );
    lastStandTime = millis();
}








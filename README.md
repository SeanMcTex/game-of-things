^ This is my work in progress for my CocoaConf 2016 presentation. This file is Markdown specifically formatted for presentation in Deckset, so it may look a bit funky if you're viewing it on GitHub.

# A Game 
# of Things
## (W)inter(net) is coming.

^ Introduction: I'm Sean McMains. I'm an Associate Director of iOS at [redacted] here in Austin. Until very recently, we were Mutual Mobile, but figured that six years old was about the right time for a tech company to have a midlife crisis, so we bought a convertible, got highlights in our hair, and changed our name. 

^ No, seriously, it's actually a pretty exciting time for us. We're expanding our focus beyond mobile into more of full-service operation, and have changed our name and branding to reflect that.

----

![Fit](91OkqM3KPlL.jpg)

^ The Iron Throne

^ So, anytime you reference A Game of Thrones in a technical presentation, you have to include a photo of The Iron Throne for at least seven minutes. It's a law now. Congress passed in in 2014. Look it up.

^ Incidentally, one of the first results I got when I searched for "The Iron Throne" on Google image search was this. I thought it was pretty funny.


----

![Fit](throne.jpg)

^ And yes, that was only three slides to get to a toilet joke. That's my new record for a CocoaConf talk.


----

![Fit](91OkqM3KPlL.jpg)

^ But this talk isn't *about* A Game of Thrones. It's about the Internet of Things, and how to build stuff for it. But congress passed that law about the picture of the throne! And I don't want to make you all complicit in a federal crime. So, because I've got to get on with my topic, but have to keep this image up for six and a half more minutes, I present to you…The Connected Iron throne.

----

![Fit](91OkqM3KPlL2.jpg)

^ The Connected Iron Throne

^ Why would anyone want a connected throne? Well, this one tracks your ruling activity. If it notices you haven't gotten up for an hour, it pushes a notification to The Iron Phone (see what I did there?) to remind you to stand up and behead someone. 

----

![Fit](ironphone-2-620x620.jpg)

^ Update this to show a push notification on the lock screen.

----

![Fit](91OkqM3KPlL2.jpg)

^ It also has a vibration motor that anyone in your court can trigger to let you know that you're in danger of assassination (king looking back, "Huh?!" balloon). Finally, it has a patented Hindquarter Identification System that allows it to recognize when a new person sits in the throne and notifies the court of the latest regicide. (Some sort of Butt ID graphic.)


----

![Fit](IoT Architecture Diagram.png)

^ So let's talk about the pieces that will be necessary to create the Connected Iron Throne. Here's an architecture diagram for the whole system. Don't worry if you don't understand any of these. We'll discuss them, and then come back to this diagram in a moment. For the time being, note that we have a variety of sensors and actuators that all connect to a microcontroller. That controller, in turn, talks to a cloud service, which a variety of clients can then connect to.

^ Note that this is not the only architecture possible; one can dispense with the Cloud Service component and have clients talk directly to the microcontrollers. The disadvantage, however, is that it becomes considerably harder to interact with your IoT devices if you're not close by or on the same network, so structuring things in this way generally provides the most benefit and flexibility.

----


![Fit](91OkqM3KPlL2.jpg)

# [Fit] Sensors & Actuators

^ We have to be able to detect when the throne is occupied, so we'll install a pressure sensor under the seat of the throne. We also need a vibration motor, which we'll attach to the throne's frame as well. And finally, the Hindquarter Identification System has a serial connection that transmits a HUID (Hindquarter Unique Identifier) whenever someone assumes the throne.

^ Fancy word: an actuator is simply a motor that moves things or causes an action to take place under electronic control. Sensors and actuators are, therefore, essentially the input and output for your IoT device.

----

![Fit](91OkqM3KPlL2.jpg)

# [Fit] A Microcontroller
##\(with wireless)

^ A microcontroller is simply a fancy word for a tiny computer. Since they're designed to interact with sensors and actuators, most of them have a bunch of input and output pins. To create an IoT device, you need some way to connect to other things. Therefore, a wireless connection of some sort is essential. Bluetooth has the advantage that it's low power, but Wifi allows your device to connect to the Internet directly without having to have a bluetooth host nearby to act as a bridge. We'll look at options for both of these.

----

![Fit](91OkqM3KPlL2.jpg)

# [Fit] A Backend Service

^ For your device to be truly useful, it will very likely need some kind of backend service. This allows your device to send information somewhere. The backend receives that data, typically via a web service call. It can respond to it by logging it, making it available via a web service, sending push notifications, and creating reporting charts and graphs. The backend is essentially the communication hub for your Connected Throne service.

----

![Fit](91OkqM3KPlL2.jpg)

# [Fit] The Client

^ The client is typically a mobile or desktop computer that interacts with the backend service. In our use case, we have two kinds of clients: that of the King, who gets alerts when he hasn't brutally killed someone recently, and that of the court, which get alerted when someone new ascends to the throne, and can warn the king when an assassination attempt in immanent. Thus, our whole system together looks like this:

----

# [Fit] Microcontrollers

^ There are many available. We'll be covering some of the most popular options here, but there are dozens of other boards available that could be used. But I would personally recommend sticking with one of the more popular options, as you'll be able to find much more information out on the Internet to support your efforts.

----

![](arduino_family.jpg)

##[Fit] Arduino

^ Open-source hardware & software. Myriad hardware options available, some starting at about $8. Comes with its own Java-based IDE. Uses the Processing language, which is C-like and easy to get the hang of. First arduino introduced in 2005, rapidly became a hobbyist favorite. Connectivity is a bit of a challenge and gets expensive (wifi shield $40-$50), but there's a ton of support out there for it.

----
![Inline](cutout-cortado_1024x1024.png)
# [Fit] Light Blue Bean

^ Because it's an open-source platform, there are *lots* of Arduino-compatible spinoffs available as well. One we've had particular fun with is the Light Blue Bean, which has Bluetooth LE support built in to it, and can run for months on a single coin cell battery.

----

![Inline](Raspberry_Pi_2_Model_B_v1.1_top_new_\(bg_cut_out\).jpg)

## [Fit]Raspberry Pi
 
 
^ Complete ARM computer on a board for $35. Usually runs Linux variants, though Windows 10 and Android are available on it as well. Mix of open and closed source. Hugely popular, has a ton of I/O and decent processing capabilities. First introduced in February 2012, Raspberry Pi 2 in 2014. Requires $10 USB wifi dongle to get it on a network. One can develop for it using a wide variety of languages.
 
----
 
 ![Inline](family_portrait_outlines-ff57b991.png)
 
##[Fit] Photon/Electron

^ The Photon and Electron are Particle.io's development boards. The Photon is $19 and has wifi built-in, while the new $39 Electron has a cellular radio and a SIM card for data transmission. They use a similar Processing language to what the Arduino uses, and can be programmed over the air using Particle's web-based IDE. Unlike the other controllers, these boards are designed to work with a single, particular backend: the free Particle.io service.

----

![](700px-Newbundle1.jpg)

##[Inline]Grove

^ You may also bump into the Grove ecosystem as you work with IoT projects. Grove is essentially a combination of a base shield that can work with a variety of microcontrollers and modularized components, bringing a good deal of plug-and-play ease to prototyping projects. There are Grove interface boards for each of the platforms listed above, and the modular sensors and actuators will work with any of the platforms.

----

# Backend Services

 - Particle.io
 - IBM IoT Foundation
 
----
 
![Fit](microsoft-azure-logo.jpg)

^ Micosoft Azure IoT: http://www.microsoft.com/en-us/server-cloud/internet-of-things/azure-iot-suite.aspx. Provides Monitoring, Asset Management, and Analytics/Predictive Maintenance. Tailored and well-suited to things like utilities, installed machinery (like elevators), factory monitoring and automation, etc.

----

![Fit](bluemix.png)

^ IBM's offering is similar to Microsoft's: enterprise grade services with an emphasis on large-scale management. IBM has an excellent presence here locally, and actively supports the iOS community, so they're definitely one I would look at if I were targeting a large-scale implementation.

----
# [Fit]AWS

AWS IoT: https://aws.amazon.com/iot/

^ Has common functionality, plus "shadow" devices that allow you to write updates to devices that will be applied when they next connect. Rules engine provides some capabilities for querying data SQL-style, and acting automatically on it. Can drive DB export, alerts, etc. Works nicely with other tools in Amazon's cloud suite. Has SDKs for C, Node, Arduino, and Mobile. Can put permission restrictions on particular devices. Fair bit of work to get things up and running.

 - Many other good backend services (Lambda, e.g.) that could be used for IoT, but which aren't tailored for it.
 
---- 

![Fit](IFTTT_Logo.svg.png)

^ Another service you'll want to be aware of as you're developing your solution is IFTTT, short for "IF this THEN that". It's a terrific service that allows mere mortals to set up conditional logic, and which has integrations to a huge variety of services. If you want to trigger a Hue light to turn red and text the paramedics your GPS location when you log a 180/110 blood pressure on your Withings blood pressure cuff, IFTTT is the glue that makes this easy to do.

----
# Client

^ So, let's talk about the client. In our case, since this is CocoaConf, we'll be considering how to write client for iOS. Our approach will vary depending on the comnmunication technology we're using. For BLE connections, CoreBluetooth will allow us to talk to the device directly. If we're connected over Wifi, we'll likely use REST calls, either to the device directly, or to the backend service. In addition, many services provide an SDK to make talking to their systems even easier.

----

# [Fit]Let's Build It!

^ So now we know what pieces we need. Let's start to put this thing together! For our stack, we'll be using standard sensors and actuators. For the microcontroller, we'll use the Photon. Its built-in wifi and reasonable price make it an attractive option for us. (Plus, I wanted an excuse to buy one.) Because it is tightly integrated with the Photon and has a really nicely thought-out REST API, we'll use Particle.io for our backend. And finally, we'll write a small custom client for iOS and see how that works. With all of that in mind, let's take a closer look at each of the layers in our system and see what we need to make it work.


----

![Inline](sensorforceresistor.jpg)
#[Fit]Pressure Sensor

^ So here's a common type of pressure sensor. It's analog -- not only does it report that there's someone sitting on the throne, but it also gives you an idea of how much that person weighs. Electrically, it's essentially a variable resistor: if nobody's sitting on it, its resistance is 20MOhms -- very high. The more pressure is applied to it, the less resistance it provides. For this application, all we care about is whether there's somebody sitting on it, so we'll simply see if the resistance goes below a threshold value.

----

```c
int Senval=0;
int Senpin=A0;

void setup()
{
    Serial.begin( 9600 );
}

void loop()
{
    Senval = analogRead( Senpin );
    Serial.println( Senval );
    delay( 200 );
}
```

^ There are a lot of interesting things to learn here in your first microcontroller code! First off, you'll notice that this looks a lot like C. That's because it is. Most microcontrollers use a similar subset of C with the same set of library functions to support interacting with inputs and outputs. (Of course, there are also hardware-specific additions for unique features; we'll see some of those later.)

^ You'll also note that there are two methods defined: `setup()` and `loop()`. These are also common features of controller code. The setup method gets called once when the system powers up or is reset. It's the place to do any setup and initialization.

^ 
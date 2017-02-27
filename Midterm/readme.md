#Midterm Project Ideas

##1. Pitch recognition

Inspiration: https://www.arduino.cc/en/Tutorial/TonePitchFollower?from=Tutorial.Tone2
             https://www.arduino.cc/en/Tutorial/ToneKeyboard?from=Tutorial.Tone3
             https://www.hackster.io/lindsi8784/electronic-piano-keyboard-with-preset-songs-74ee7c?ref=search&ref_id=piano&offset=7

Something that is hard for people to grasp at first is the specific quality that each chord possesses, and how to tell the difference between the different chord types. For starters, major chord vs. minor chord: These two are associated with having happy and sad qualities, respectively. I would love to build a basic keyboard (like in the examples above) and then associate different quality chord with different LED colors. Everything I am reading online seems to say that the pitches can only be played one after the other, therefore I will have to program the arduino to figure out the chord quality based on a series of three pitches played in succession- each button may be programmed to be a different pitch, or it could be determined by frequency of pitch, or both(?). Once the arduino successfully matches the user input with a programmed chord, a light will turn on the arduino to indicate whether the chord played was major or minor. Yellow led for happy sound, therefore major in quality, blue led for sad sound, therefore minor in quality. However, a flaw to this is what to do if the input notes do not match one of the programmed chords. Also, there would be a problem with response if user does not know how to build a chord (maybe a solution to this would be having a limited number of note options).

Final project musings: This idea has room for further development into a product for young children to learn chord qualities. Using some sort of interface such as an animal or robot, facial expressions on this character can help communicate the sad or happy quality of the chord. This project can also expand into involving diminished chords (associated with sounding scary) and maybe potentially augmented chords (associated with dreamlike quality).

##2. Any variation on the above^^

I think I put several project ideas into the first... different keyboard features, different user input, different methods of pitch detection, etc.

##3.

Inspiration: http://www.instructables.com/id/Singing-plant-Make-your-plant-sing-with-Arduino-/

This combines two things I love: plants and sound! I think the idea of measuring capacitance to create sound seems really cool. I would definitely want to try different kinds of plants besides the ones pictured. What would happen if a user *carefully* touched the thorn of a cactus instead? What about on different areas of the cactus?

This can be expanded to just feeling different textures and objects and "hearing" the sound that the programs creates from your capacitance. Basically a different hands-on experience(literally) for users to interact with everyday objects differently than they would before.

Drawbacks- seems very complicated and maybe not achievable for a midterm project.

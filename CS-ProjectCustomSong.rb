"Song #1"

use_bpm 118
use_synth :fm

"Samples for both songs"
intro ="/Users/alondrarobles/Downloads/11. Aaliyah - Old School.wav"
clip = "/Users/alondrarobles/Downloads/clip.wav"
chorus1 = "/Users/alondrarobles/Downloads/Smokey Robinson & the Miracles - You Really Got A Hold On Me - A Capella Vocal Track.wav"
vocals = "/Users/alondrarobles/Downloads/Smokey Robinson & the Miracles - You Really Got A Hold On Me - A Capella Vocal Track.wav"
transition = "/Users/alondrarobles/Downloads/Hypnotize (2007 Remaster).wav"
chorus = "/Users/alondrarobles/Downloads/Notorious Big - Hypnotize.wav"
background = "/Users/alondrarobles/Downloads/The Notorious B.I.G. - Hypnotize [Instrumental].wav"
outro = "/Users/alondrarobles/Downloads/Snoop Dogg & Wiz Khalifa - Young, Wild & Free (feat. Bruno Mars) [Official Audio Video HD].wav"

"Functions for both songs"
define :ptmd do
  play :A2, amp: 4
  sleep 2.5
  play :Fs2, amp: 4
  sleep 0.5
  play :A2, amp: 4
  sleep 1.5
end

define :cymbal do
  5.times do
    sample :drum_cymbal_closed, sustain: 0.5, amp: 0.75
    sleep 0.5
  end
  sample :drum_tom_mid_soft
  sleep 0.5
end

define :melo  do
  play :e2
  sleep 0.5
  play :e2
  sleep 0.5
  play :d
  sleep 0.25
  play :e2
  sleep 0.5
  play :e2
  sleep 0.25
  play :e2
  sleep 0.5
  sleep 0.5
  play :d
  sleep 0.75
  play :e2
  sleep 0.25
  play :e2
  sleep 0.5
  play :e2
  sleep 0.5
  play :d
  sleep 0.25
  play :e2
  sleep 0.75
  play :e2
  sleep 0.5
  sleep 1
end

"Array for both songs"
start = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9,1]
finish = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9,1]
ampin = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9,1]
ampout = [1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0]

"Paramerterized Function for both songs"
define :cut do |strt, fin|
  sample clip, start: strt, finish: fin
  sleep 0.5
end

define :fadein do |s,z|
  index = 0
  10.times do
    sample s, start: start[index], finish: finish[index], amp: ampin[index]
    sleep z
    index = index + 1
  end
end

define :fadeout do |my_sample, my_sleep|
  index = 0
  10.times do
    sample my_sample, start: start[index], finish: finish[index], amp: ampout[index]
    sleep my_sleep
    index = index + 1
  end
end

"Intro"

fadeout intro, 21.6/10.0

index = 0
intro = [:E4, :E4, :Fs4, :A4, :B4, :A4, :Fs4]

live_loop :intro1 do
  7.times do
    play (intro[index])
    sleep 0.5
    index = index + 1
  end
  stop
end

introtwo = [:E2, :E2, :Fs2, :A2, :B2, :Fs2]

live_loop :intro2 do
  6.times do
    play (introtwo[index])
    sleep 0.5
  end
  stop
end

sleep 3.5

"background Cymbals"
live_loop :melodypt1 do
  20.times do
    cymbal
  end
  stop
end

"Main Melody"
live_loop :guitarish do
  2.times do
    2.times do
      ptmd
      play :Fs2, amp: 4
      sleep 1
      play :E2, amp: 4
      sleep 0.5
      ptmd
      play :G2, amp: 4
      sleep 0.5
    end
    sleep 6
  end
  stop
end

sleep 5

"Vocals"
live_loop :vocals_sng1 do
  2.times do
    sample vocals
    sleep 34
  end
  stop
end

sleep 60

"Fade Out"
volume = 0.75

15.times do
  sample :drum_cymbal_closed, sustain: 0.5, amp: volume
  sleep 0.5
  volume = volume - 0.05
end

"Trumpets/outro for song 1"
live_loop :end do
  2.times do
    cut 0, 0.2
    cut 0, 0.2
    cut 0.2, 0.5
    cut 0.5, 1
  end
  stop
end

"Song Two"
use_bpm 94
use_synth :piano

"Tranistion"
fadein transition, 7/10.0

"Main Melody"
live_loop :melody do
  12.times do
    melo
  end
  stop
end

"Backgroud drums"
live_loop :background do
  74.times do
    sample :drum_cymbal_closed
    sleep 2
  end
  stop
end

"Vocals"
live_loop :vocals do
  3.times do
    sample chorus
    sleep 41
  end
  stop
end

sleep 113

"Melody stopped and then picks back up here"
live_loop :melody do
  5.times do
    melo
  end
  stop
end

sleep 35

"Outro"
fadeout outro, 24/10.0

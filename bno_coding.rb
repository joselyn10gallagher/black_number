#Black Number One
sleeping = "C:/Users/joselyn_gallagher/Desktop/samples/sleeping_b.wav"
scream1 = "C:/Users/joselyn_gallagher/Desktop/samples/scream1.wav"
scream2 = "C:/Users/joselyn_gallagher/Desktop/samples/scream2.wav"
section1v = "C:/Users/joselyn_gallagher/Desktop/samples/black_vocals.wav"
section2v = "C:/Users/joselyn_gallagher/Desktop/samples/black_vocals2.wav"
riff = "C:/Users/joselyn_gallagher/Desktop/samples/black_guitar.wav"
guitar = "C:/Users/joselyn_gallagher/Desktop/samples/guitar_test.wav"

pan = 1
drum = 1

define :drums_loop do
  sleep 1
  sample :drum_snare_soft, amp: drum
  sleep 2
  sample :drum_snare_soft, amp: drum
end

define :synth_loop do
  use_synth :dtri
  play :b7, amp: 0.25
  play :as7, amp: 0.25
end

# Intro
sample sleeping, amp: 7
sleep 19
2.times do
  sample scream1, pan: pan
  sleep 0.5
  pan = pan - 1
end
sample scream2

#First Section
use_bpm 90

sample section1v, amp: 3

sleep 4.25
live_loop :bass do
  2.times do
    3.times do
      4.times do
        play :e2, amp: 2
        sleep 0.5
      end
      4.times do
        play :g2, amp: 2
        sleep 0.5
      end
      3.times do
        play :b2, amp: 2
        sleep 0.5
      end
      play :a2, amp: 2
      sleep 1
      play :a2, amp: 2
      sleep 0.5
      play :g2, amp: 2
      sleep 0.5
      play :a2, amp: 2
      sleep 0.5
    end
    4.times do
      play :e2, amp: 2
      sleep 0.5
    end
    4.times do
      play :g2, amp: 2
      sleep 0.5
    end
    play :b2, amp: 2
    sleep 0.5
    play :d3, amp: 2
    sleep 0.5
    2.times do
      play :a2, amp: 2
      sleep 0.5
    end
    sleep 3.5
  end
  stop
end

sleep 8
live_loop :drums do
  5.times do
    drums_loop
    sleep 1
    drum = drum + 0.5
  end
  stop
end

drum = 5
sleep 23.5
live_loop :drums do
  6.times do
    drums_loop
    sleep 1
  end
  stop
end

sleep 2
live_loop :synth do
  use_synth :dtri
  use_bpm 90
  3.times do
    3.times do
      2.times do
        synth_loop
        sleep 0.5
      end
      play :fs7, amp: 0.25
      sleep 0.5
      play :g7, amp: 0.25
      sleep 0.5
    end
    3.times do
      synth_loop
      sleep 0.5
    end
    play :fs7, amp: 0.25
    sleep 0.5
  end
  stop
end
sleep 27.25
sample riff

#Section 2

sleep 4.25
sample section2v, amp: 3
sleep 1.8
sample guitar, rate: 1.1
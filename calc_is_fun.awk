#!  /usr/bin/awk -f
BEGIN{
  FS=":"
  score=0
  print"please enter your name below:"
  getline user_name
  print"Hey" " " user_name " " "welcome to level 1" "\n" "press enter to play"
};
#generating random no.s
{
  srand()
  no_1=int(rand * 100)+1
  no_2=int(rand * 100)+1
  ques_type=int(rand*3)+1
}
#level one
(score < 25){
 if(ques_type ==1){
   solution=int(no_1 + no_2)
   operator="+"
 }
 if(ques_type == 2){
   solution=int(no_1 * no_2)
   operator="*"
 }
 if(ques_type == 3){ 
   if(no_1 > no_2 ){
     solution=int(no_1 % no_2)
     operator="%"
   }
   else{
     solution=int(no_1 - no_2)
     operator="-" 
   }
 }
 {
   print no_1 " "operator " "no_2
   getline input
 }
 if(input == solution){
   print"correct answer"
   score+=10
   print "score: " score
 }
 else{ 
   print"wrong answer" "\n" "correct ans. is:" solution
 }
};
(score == 30 || score ==  60 || score == 100 || score == 150){
  print"would you like to play more (y/n):"
  getline confirmation
  if(confirmation=="n"){
    print user_name ":" score >> "scores_file"
    exit
  }
};
#level 2
(score >= 30){
  
  {
    print"Level Up :)" "\n" "scrabble words"
    x=getline <"scrabble_words_file"
  }
  if(x!=0){
    split($2,letters,"")
    for(letter in letters){
      printf " " letters[letter]
    }
    printf " :"
    getline word
    if(word==$1){
      score+=10
      print "correct ans" "\n" "score is: " score
    }
    else{
      print "wrong guess, correct ans is:" $1
    }
  }
next
};
END{
};


   

  

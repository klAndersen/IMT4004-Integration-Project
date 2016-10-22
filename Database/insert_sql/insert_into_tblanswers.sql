INSERT INTO `ailearninggame`.`tblanswers` VALUES (
null,
"Selection of DNA from parents.", -- the answer option for this question
0, -- boolean value, is this option the correct one?; 0=false, 1=true
"", -- corresponding information/description to what this answer is, can be blank
(Select questionID from `ailearninggame`.`tblquestion` where question="What is mutation?") 
-- this is the id of the question to which this answer option belongs to
);

INSERT INTO `ailearninggame`.`tblanswers` VALUES (
null,
"Alteration of the original values in the DNA.", 
1, 
"",
(Select questionID from `ailearninggame`.`tblquestion` where question="What is mutation?") 
);

INSERT INTO `ailearninggame`.`tblanswers` VALUES (
null,
"It is the same as the fitness function.", 
0, 
"",
(Select questionID from `ailearninggame`.`tblquestion` where question="What is mutation?") 
);


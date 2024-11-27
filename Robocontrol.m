
global key
InitKeyboard();


while 1 
    pause(0.1); 
    
   
    switch key
        case 'w'  
            disp('Moving Forward');
            brick.MoveMotor('AB', 50); 
            
        case 's'  
            disp('Moving Backward');
            brick.MoveMotor('AB', -50); 
            
        case 'a'  
            disp('Rotating Left');
            brick.MoveMotor('A', -50); 
            
        case 'd'  
            disp('Rotating Right');
            brick.MoveMotor('B', -50); 

        case 'e' 
            disp('Forklift Moving Up');
            brick.MoveMotor('C', 30); 

        case 'r'
            disp('Forklift Moving Down');
            brick.MoveMotor('C', -30); 
            
        case 'q'  
            disp('Exiting control...');
            break;
    end
end


CloseKeyboard();


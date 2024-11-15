
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
            
        case 'q'  
            disp('Exiting control...');
            break;
    end
end


CloseKeyboard();


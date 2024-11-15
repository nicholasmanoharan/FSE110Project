speed = 100;          
reverseSpeed = 33;    
gear = 1;            
maxGear = 3;          
handbrakeActive = false;


function toggleHandbrake()
    global handbrakeActive;
    if handbrakeActive
        stopCar(); 
    end
    handbrakeActive = ~handbrakeActive;
end


function stopCar()
    global speed;
    speed = 0;
    setMotorSpeed(0);  
end


function reverse()
    global reverseSpeed;
    setMotorSpeed(-reverseSpeed); 
    beep(); 
end


function checkCollision()
    if touchPressed(1) || touchPressed(2) 
        playTone(440, 500); 
    end
end


function adjustSpeedByColor()
    global speed;
    color = getColorCode(); 
    if color == 'Red'
        speed = min(speed, 66);
    elseif color == 'Yellow'
        speed = min(speed, 33); 
    end
    setMotorSpeed(speed);
end


function manualGearShift(key)
    global speed gear;
    if strcmp(key, 'gear_up') && gear < maxGear
        gear = gear + 1;
    elseif strcmp(key, 'gear_down') && gear > 1
        gear = gear - 1;
    end
    speed = 33 * gear;
    setMotorSpeed(speed);
end


while true
    
    waitforbuttonpress;
    key = get(gcf, 'CurrentCharacter'); 

    
    if strcmp(key, ' ')
        toggleHandbrake();
    end
    
    
    if ~handbrakeActive
        switch key
            case 'w' 
                setMotorSpeed(speed);
            case 's' 
                reverse();
            case 'u' 
                manualGearShift('gear_up');
            case 'd' 
                manualGearShift('gear_down');
            otherwise
                stopCar(); 
        end
    end

    
    checkCollision();

    
    adjustSpeedByColor();

    pause(0.1); 
end

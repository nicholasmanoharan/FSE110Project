global key
InitKeyboard(); 

while 1 
  pause(0.1);
  switch key
    case 'uparrow'
      disp('Up Arrow Pressed'); 
    case 'downarrow'
      disp('Down arrow presses');
    case 'leftarrow'
      disp('Left Arrow Pressed');
    case 'rightarrow'
      disp('Right Arrow Pressed'); 
    case 0 
      disp('No key pressed'); 
    case 'q' 
      break; 
  end
end
CloseKeyboard(); 

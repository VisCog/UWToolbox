clear all; close all;

try
    KbName('UnifyKeyNames');
    
    display.dist = 30; % cm
    display.width = 40; % cm
    display = OpenWindow(display); % open psychtoolbox screen
    
    drawText(display, 'Welcome to the OpenWindowDemo.m', display.resolution.*[0.5 0.45]);
    drawText(display, 'Press [space] to continue', display.resolution.*[0.5 0.55]);
    Screen('Flip', display.window);
    wait4key('space');
    
    drawText(display, 'You can draw fixation squares', display.resolution.*[0.5 0.45]);
    drawText(display, 'Press [space] to continue', display.resolution.*[0.5 0.55]);
    drawFixation(display); % flips screen in this function as default
    wait4key('space');
    
    drawText(display, 'You record key presses for a specified time', ...
        display.resolution.*[0.5 0.45]);
    drawText(display, 'Press any keys!', display.resolution.*[0.5 0.55]);
    Screen('Flip', display.window);
    keys = waitTill(5); % wait 5 secs
    
    drawText(display, 'Key(s) Pressed', display.resolution.*[0.5 0.4]);
    drawText(display, sprintf(' %s', strjoin(keys, ' ,')), ...
        display.resolution.*[0.5 0.45]);
    drawText(display, 'Press [space] to continue', display.resolution.*[0.5 0.55]);
    Screen('Flip', display.window);
    wait4key('space');
    
    drawText(display, 'And many more functions to play with!', display.resolution.*[0.5 0.45]);
    drawText(display, 'Press [space] to finish!', display.resolution.*[0.5 0.55]);
    Screen('Flip', display.window);
    wait4key('space');
    
    Screen('CloseAll');
catch ME
    Screen('CloseAll');
    rethrow(ME);
end

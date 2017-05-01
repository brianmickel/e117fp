function userInput = getUserInput(obj)
    display('Starting Listen')
    set(gcf,'doublebuffer','on');
    set(gcf,'KeyPressFcn','keydown=1;');

    j = 5;
    keyIn = '';
    keydown = 0;
    tStart = tic;
    while true
        keyIn = double(get(gcf,'CurrentCharacter')); % compare the values to the list
        % below:
        %     28 => leftArrow
        %     29 => rightArrow
        %     30 => upArrow
        %     31 => downArrow
        if keydown == 1 % a key was pressed
            display('Key pressed');
            keydown = 0;
            switch keyIn
                case 28
                    fprintf('left\n');
                case 29
                    fprintf('right\n');
                case 30
                    fprintf('up\n');
                case 31
                    fprintf('down\n');
                otherwise
                    break;
            end

            break;
        else
            if (toc(tStart) > 1)
                userInput = {};
                break;
            else
                continue;
            end
        end
        pause(0.05);
    end
    display('Ending Listen');
end
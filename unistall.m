%% MATLAB Library System uninstallation script
% By running this script the content of the current folder's `library` folder 
% will be removed from the MATLAB path permamently on your system.

% IMPORTANT: before you run the script navigate your Current Folder to the
% DSP Sandbox repo root, otherwise the installation will be unsuccessful..

% The MIT License (MIT)
% 
% Copyright (c) 2015 Tibor Simon
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.


disp(' ');
try
    if core_checkenvironment(dir);
        [name, version] = core_getlibrarydata();
        
        rootDirectory = strcat(pwd,'\');
        rmpath(strcat(rootDirectory,'.core_system'));
        
        disp(['    path removed: ', strcat(rootDirectory,'.core_system')]);

        allLibraryDirectories = regexp(genpath('library'),['[^;]*'],'match');

        for k=1:length(allLibraryDirectories)
            newPath = strcat(rootDirectory,allLibraryDirectories{k});
            rmpath(newPath);
            disp(['    path removed: ', newPath]);
        end

        savepath;

        disp(' ');
        disp([name, ' ', version, ' has been successfully removed from your system!']);
        disp(' ');
        clear name version newPath rootDirectory allLibraryDirectories
    else
        error('Error: You are in the wrong folder! Make sure you navigate to the root folder of your library that contains the uninstall script!');
    end
catch err
    clear err;
    error('Error: Your library has been uninstalled already..')
end 

clear ans currentFolders result k
% This function prints the strings of the obtained state space system. 

% Author(s): Yitong Li

%% Notes
%
% This function prints the string based on the order of apparatuses, because
% GmObj is obtained by appending the apparatus models.

%%

function PrintSysString(DeviceBus,DeviceType,DeviceCell,ZbusStateStr)

%% Get strings
for n = 1:length(DeviceCell)
    [DeviceStateStr{n},DeviceInStr{n},DeviceOutStr{n}] = DeviceCell{n}.GetString(DeviceCell{n});
end

%%
N_Device = length(DeviceBus);

%% Print state string
fprintf('\n')
fprintf('  Model state in order:\n');
CountState = 0;
% Apparatus
IndexState{1} = 1;
for i = 1:N_Device
    fprintf(['    Apparatus ',num2str(i),':\n']);
    IndexState{i+1} = SimplusGT.PrintIndexCell(DeviceStateStr{i},6,IndexState{i});
    IndexState{i+1} = IndexState{i+1} + 1;
end
% Network
fprintf(['    Network line:\n']);
SimplusGT.PrintIndexCell(ZbusStateStr,6,IndexState{N_Device+1});

%% Print input string
fprintf('\n')
fprintf('  Model input in order:\n')
% Print apparatus input string
IndexInput{1} = 1;
for i = 1:N_Device
    fprintf(['    Bus ',num2str(DeviceBus{i}),':\n'])
    IndexInput{i+1} = SimplusGT.PrintIndexCell(DeviceInStr{i},6,IndexInput{i});
    IndexInput{i+1} = IndexInput{i+1} + 1;
end

%% Print output string
fprintf('\n')
fprintf('  Model output in order:\n');
% Print apparatus input string
IndexOutput{1} = 1;
for i = 1:N_Device
    fprintf(['    Bus ',num2str(DeviceBus{i}),':\n']);
    IndexOutput{i+1} = SimplusGT.PrintIndexCell(DeviceOutStr{i},6,IndexOutput{i});
    IndexOutput{i+1} = IndexOutput{i+1} + 1;
end

fprintf('\n')
end
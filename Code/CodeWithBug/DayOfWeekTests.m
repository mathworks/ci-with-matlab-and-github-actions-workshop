classdef DayOfWeekTests < matlab.unittest.TestCase
    % Creates 7 test points, one for each day of the week
    
	% Copyright 2022 The MathWorks, Inc.
	
    properties (TestParameter)
        monthNum = {1};
        dayNum = num2cell(3:9);
        yearNum = {2021};
    end
    
    methods (Test)
        function testDayofweek(testCase,monthNum,dayNum,yearNum)
            % Convert numeric values to mm/dd/yyyy string
            % Note: MATLAB will automatically convert numbers to strings
            % when performing number+string arithmetic
            dateStr = monthNum + "/" + dayNum + "/" + yearNum;
            
            % Compute expected result
            dt = datetime(dateStr,"Format","MM/dd/uuuu");
            [dowExpected,nameExpected] = weekday(dt,"long");
            nameExpected = string(nameExpected);
            
            % Compute actual result
            [dowActual,nameActual] = dayofweek(dateStr);
            
            % Verify that the actual result matches the expected result
            testCase.verifyEqual(dowActual,dowExpected);
            testCase.verifyEqual(nameActual,nameExpected);
        end
    end
    
end


function [dow,name] = dayofweek(ddmmyyyy,dateFormat)
%DAYOFWEEK Converts a date string ("dd/mm/yyyy") to the day number of the
%week.

% NOTE: MATLAB already does easily this using:
%           [DayNumber,DayName] = weekday(D)
%       where d is a datetime object

% Copyright 2022 The MathWorks, Inc.

arguments
    ddmmyyyy string;
    dateFormat (1,1) string {mustBeMember(dateFormat,["mm/dd/yyyy","dd/mm/yyyy"])} = "mm/dd/yyyy";
end

% Check that ddmmyyyy was provided in the appropriate format
if numel(split(ddmmyyyy,"/")) ~= 3
    error("dayofyear:InvalidDateFormat","Invalid date string. Expected date formatted as dd/mm/yyyy.")
end

% Create a datetime object depending on the dateFormat provided
if dateFormat == "mm/dd/yyyy"
    d = datetime(ddmmyyyy,"Format","MM/dd/uuuu");
else
    d = datetime(ddmmyyyy,"Format","dd/MM/uuuu");
end

% Calculate day of year
dow = day(d,"dayofweek");

% Get the name of the day
weekdayNames = [ ...
    "Sunday"
    "Monday"
    "Tuesday"
    "Wednesday"
    "Thursday"
    "Friday"
    "Saturday"];
name = weekdayNames(dow);


end


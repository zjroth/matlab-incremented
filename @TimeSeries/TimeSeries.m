% DESCRIPTION:
%    Provide convenient access to neural data and methods related to ripple
%    detection.
%
% PROPERTIES:
%    .
%
% METHODS:
%    .
%
classdef TimeSeries < timeseries
    methods (Access = public)
        % USAGE:
        %    obj = NeuralData()
        %
        % DESCRIPTION:
        %    .
        %
        % ARGUMENTS:
        %    .
        %       .
        function this = TimeSeries(varargin)
            this = this@timeseries(varargin{:});
        end
    end

    methods (Access = public)
        function [nMax, nTime] = max(this)
            [nMax, nIdx] = max(this.Data);
            nTime = this.Time(nIdx);
        end

        function objSubseries = subseries(this, dMinTime, dMaxTime)
            idxs = (this.Time >= dMinTime & this.Time <= dMaxTime);
            objSubseries = getsamples(this, idxs);
        end
    end
end

%Parameter=load('/udd/nforde/Nina/StageEEGpre/data/RAWformat_Test4_results/project_state.mat')



addAutomagicPaths();

name = 'commandline_project2';
dataFolder = '/udd/nforde/Nina/StageEEGpre/data/EEG/raw/';
resultsFolder = '/tmp/data/resultsautohbn/';
ext = '.mat';
Params= struct('FilterParams',         struct('notch', struct('freq',  50), ...
                                               'high',  struct('freq',  0.5, 'order', []),... % Default order for filtering
                                               'low',   struct('freq',  30, 'order', []),...
                                               'zapline',   struct('freq', 50, 'ncomps', 3)),...
                 'CRDParams',           struct('ChannelCriterion',      0.85,...
                                               'LineNoiseCriterion',    4,...
                                               'BurstCriterion',        5,...
                                               'WindowCriterion',       0.25, ...
                                               'Highpass',              [0.25 0.75]), ...
                 'PrepParams',          struct(), ...
                 'HighvarParams',       struct('sd', 25), ...
                 'InterpolationParams', struct('method', 'spherical'), ...
                 'RPCAParams',          struct('lambda', [], ...                    % Default lambda by alm_rpca
                                               'tol', 1e-7, ...
                                               'maxIter', 1000), ...
                 'MARAParams',          struct('chanlocMap', containers.Map, ...
                                               'largeMap', 0, ...
                                               'high',  struct('freq', 1.0, 'order', [])), ...
                 'ICLabelParams',       struct('brainTher', [], ...
                                               'muscleTher', [0.8 1], ...
                                               'eyeTher', [0.8 1], ...
                                               'heartTher', [0.8 1], ...
                                               'lineNoiseTher', [0.8 1], ...
                                               'channelNoiseTher', [0.8 1], ...
                                               'otherTher', [], ...
                                               'includeSelected', 0, ...
                                               'high',     struct('freq', 2.0, 'order', [])),...
                 'EOGRegressionParams', struct(), ...
                 'ChannelReductionParams', struct('tobeExcludedChans', []), ...
                 'EEGSystem',           struct('name', 'EGI',...
                                               'sys10_20', 0, ...
                                               'locFile', '', ...
                                               'refChan', struct('idx', []), ...
                                               'fileLocType', '',...
                                               'eogChans', [1 8 14 17 21 25 32 125 126 127 128], ...
                                               'powerLineFreq', []), ...
                 'Settings',            struct('trackAllSteps', 0, ...
                                               'pathToSteps', '/allSteps.mat',...
                                               'colormap','Default',...
                                               'sortChans', 0)...
                 );
     

VisualisationParams = struct();
samplingrate=[];

%save(Params, 'config_20211007.mat')


                                              
project = Project(name, dataFolder, resultsFolder, ext, Params, VisualisationParams, samplingrate);
project.preprocessAll();
project.interpolateSelected();
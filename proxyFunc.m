function proxyFunc(app)

    checkData3D(app,app.resizedAllData,str2double(app.CheckData3DDropDown.Value),app.NCenters,app.ribbon(1).grouped,app.ribbon(2).grouped,app.imageSize,[app.NChEditField.Value,app.PreChEditField.Value,app.PostChEditField.Value,app.LastChEditField.Value],app.resizedDimensions,app.resizedVoxel,app.dimensions);
end
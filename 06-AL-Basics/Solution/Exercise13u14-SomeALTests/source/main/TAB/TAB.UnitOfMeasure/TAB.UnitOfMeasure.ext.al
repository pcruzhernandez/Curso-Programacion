tableextension 60100 "CCO Unit of Measure +" extends "Unit of Measure"
{
    fields
    {
        modify(Description)
        {
            trigger OnBeforeValidate()
            begin
                ObjectCU.LaunchConfirm('OnBeforeValidate - Table Extension');
            end;

            trigger OnAfterValidate()
            begin
                ObjectCU.LaunchConfirm('OnAfterValidate - Table Extension');
            end;
        }
    }


    var
        ObjectCU: codeunit "CCO T Unit of Measure +";
}
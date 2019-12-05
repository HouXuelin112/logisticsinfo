package it.hxl.jstltag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
@SuppressWarnings("serial")
public class DateTag extends TagSupport {

    private Date date;
    @Override
    public int doEndTag() throws JspException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String targetTime = format.format(date);
        try {
            super.pageContext.getOut().write(targetTime);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return super.doEndTag();
    }

    public void setDate(Date date){
        this.date = date;
    }
}

package priv.yuan.utils;

/**
 * @author yuanyuan
 * @version 1.0
 * @date 2020/5/11 3:24
 */
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

public class CustomDate implements WebBindingInitializer{
    /**
     * Initialize the given DataBinder.
     *
     * @param binder the DataBinder to initialize
     * @since 5.0
     */
    @Override
    public void initBinder(WebDataBinder binder) {
        // TODO Auto-generated method stub
        //转换日期
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @Override
    public void initBinder(WebDataBinder binder, WebRequest request) {
        // TODO Auto-generated method stub
        //转换日期
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}

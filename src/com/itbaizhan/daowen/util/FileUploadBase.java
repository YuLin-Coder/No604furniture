package com.itbaizhan.daowen.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

public abstract class FileUploadBase{
    protected Map<String, String> parameters = new HashMap<String, String>();// ������ͨform�?��

    protected String encoding = "utf-8"; // �ַ�������ȡ�ϴ��?�ĸ��ʱ���õ���encoding

    protected UploadFileFilter filter = null; // �ļ�������

    /** *//** *//** *//**
     * The directory in which uploaded files will be stored, if stored on disk.
     */
    protected int sizeThreshold = DiskFileItemFactory.DEFAULT_SIZE_THRESHOLD;

    /** *//** *//** *//**
     *
     * The maximum size permitted for the complete request, as opposed to
     *
     * {@link #fileSizeMax}. A value of -1 indicates no maximum.
     *
     */
    protected long sizeMax = -1;

    /** *//** *//** *//**
     * The directory in which uploaded files will be stored, if stored on disk.
     */
    protected File repository;

    public String getParameter(String key) {
        return parameters.get(key);
    }

    public String getEncoding() {
        return encoding;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

    /** *//** *//** *//**
     * ��ȡ�ϴ��ļ����Ĵ�С����λΪByte(�ֽڣ���Ϊ-1ʱ��ʾ������
     * @return
     */
    public long getSizeMax() {
        return sizeMax;
    }

    /** *//** *//** *//**
     * �����ϴ��ļ����Ĵ�С����λΪByte(�ֽڣ���Ϊ-1ʱ��ʾ������
     * @param sizeMax
     */
    public void setSizeMax(long sizeMax) {
        this.sizeMax = sizeMax;
    }

    public int getSizeThreshold() {
        return sizeThreshold;
    }

    public void setSizeThreshold(int sizeThreshold) {
        this.sizeThreshold = sizeThreshold;
    }

    /** *//** *//** *//**
     * Returns the directory used to temporarily store files that are larger
     * than the configured size threshold.
     *
     * @return The directory in which temporary files will be located.
     *
     * @see #setRepository(java.io.File)
     *
     */
    public File getRepository() {
        return repository;
    }

    /** *//** *//** *//**
     * Sets the directory used to temporarily store files that are larger than
     * the configured size threshold.
     *
     * @param repository
     *            The directory in which temporary files will be located.
     *
     * @see #getRepository()
     *
     */
    public void setRepository(File repository) {
        this.repository = repository;
    }

    /** *//** *//** *//**
     * ��ȡ�����б�
     * @return
     */
    public Map<String, String> getParameters() {
        return parameters;
    }

    /** *//** *//** *//**
     * ��ȡ������
     * @return
     */
    public UploadFileFilter getFilter() {
        return filter;
    }

    /** *//** *//** *//**
     * �����ļ����������Ϲ��������Ľ������ϴ�
     * @param filter
     */
    public void setFilter(UploadFileFilter filter) {
        this.filter = filter;
    }

    /** *//** *//** *//**
     * ��֤�ļ��Ƿ���Ч
     * @param item
     * @return
     */
    protected boolean isValidFile(FileItem item){
        return item == null || item.getName() == "" || item.getSize() == 0 || (filter != null && !filter.accept(item.getName())) ? false : true;
    }
}
 
 
 